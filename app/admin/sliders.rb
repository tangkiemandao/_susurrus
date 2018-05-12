ActiveAdmin.register Slider do
 permit_params :photo, :caption, :visible

 form do |f|
   f.inputs "Uploads" do
     f.input :photo, required: true, as: :file
     f.input :caption, required: true
     f.input :visible, as: :radio, collection: [ true, false ]
   end

   f.actions
 end

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
