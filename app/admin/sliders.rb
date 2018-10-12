ActiveAdmin.register Slider do
 permit_params :photo, :caption, :visible, :crop_x, :crop_y, :crop_w, :crop_h
 #permit_params!

 # edit or new page
 form do |f|
   f.inputs "Uploads" do
     f.input :photo, required: true, as: :file, hint: image_tag(f.object.photo.url, id: "preview-img", height: "auto", width: "100%").html_safe
     f.input :caption, required: true
     f.input :visible, as: :radio, collection: [ true, false ]
     f.input :crop_x, as: :hidden
     f.input :crop_y, as: :hidden
     f.input :crop_w, as: :hidden
     f.input :crop_h, as: :hidden
   end

   f.actions
 end

 # index page
 index do
   column :id
   column :caption
   column :photo do |img|
     image_tag(img.photo.url, width: 50, height: 50)
   end
   column :visible
   column :created_at
   column :updated_at
   actions
 end

 # detail page
 show do
   attributes_table do
     row :id
     row :caption
     row :image do |img|
       image_tag img.photo.url
     end
     row :created_at
     row :updated_at
   end
 end
end
