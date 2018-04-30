ActiveAdmin.register Slider do
 permit_params :image, :caption, :visible

 form do |f|
   f.inputs "Uploads" do
     f.input :image, required: true, as: :file
     f.input :caption, required: true
     f.input :visible, as: :radio, collection: [ true, false ]
   end

   f.actions
 end

 index do
   column :id
   column :caption
   column :image do |img|
     image_tag(img.image, width: 50, height: 50)
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
       image_tag img.image
     end
     row :created_at
     row :updated_at
   end
 end
end
