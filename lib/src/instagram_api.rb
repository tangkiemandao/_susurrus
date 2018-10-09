class InstagramApi < Instagram::Client
  #------------------------------------------------------#
  # This class will all of methods from Instagrams::Client
  # client = InstagramApi.new => client
  # media = client.user_recent_media
  # next_url = client.pagination.next_url
  #------------------------------------------------------#
  def user_recent_media_next_url(next_url)
    response = Faraday.get(next_url)
    response_hash = JSON.parse(response.body)
    response_hashie = Hashie::Mash.new(response_hash)
    Instagram::Response.create(response_hashie, {})
  end

  def images_url(data_json)
    images = []
    data_json.each do |data|
      images << { original_link: data.link, link: data.images.standard_resolution.url }
    end

    images
  end

  def next_url(data)
    data.pagination.next_url
  end

  def write_image_url(data)
    url = next_url(data)
    return [] if url.nil?
    data = user_recent_media_next_url(url)
    images_url(data) << write_image_url(data)
  end

  def write_yml(data)
    images_url = []
    images_url << images_url(data)
    images_url << write_image_url(data)

    images_url
  end
end
