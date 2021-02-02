ActiveAdmin.register Portfolio do
 actions :all
 permit_params :name, :introduce, :photo, :visible, :area,
               :architect, :location, :photographs, :pdf

 index do
   column :id
   column :name
   column :introduce
   column :architect
   column :location
   # column :lead_architects
   column :area
   column :photographs
   column :pdf
   column :image do |img|
     image_tag(img.photo.url(size: nil), width: 50, height: 50)
   end
   column :visible
   column :created_at
   column :updated_at
   column :details do |details|
     link_to "details", admin_portfolio_portfolio_details_path(details.id)
   end
   actions
 end

 show do
   attributes_table do
     row :name
     row :introduce
     row :architect
     row :location
     # row :lead_architects
     row :area
     row :photographs
     row :pdf do |link|
       link_to "View", link.pdf.url, target: "_blank"
     end
     row :image do |img|
       image_tag img.photo.url(size: nil), height: 100, width: 100
     end
     row :visible
   end
 end

 form do |f|
   f.inputs"Uploads" do
     f.input :name
     f.input :introduce
     f.input :architect
     f.input :location, as: :select, collection: Settings.cities
     # f.input :lead_architects
     f.input :area
     f.input :photographs
     if f.object.photo.present?
      f.input :photo, as: :file, required: true, :hint => image_tag(f.object.photo.url(size: nil)) if f.object.photo.present?
     else
      f.input :photo, as: :file, required: true
     end
     f.input :pdf, as: :file, accept: :pdf, required: true
     f.input :visible
   end

   f.actions
 end
end
