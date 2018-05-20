ActiveAdmin.register Portfolio do
 actions :all
 permit_params :name, :introduce, :photo, :visible, :area,
               :architect, :location, :lead_architects, :photographs

 index do
   column :id
   column :name
   column :introduce
   column :architect
   column :location
   column :lead_architects
   column :area
   column :photographs
   column :image do |img|
     image_tag(img.photo.url, width: 50, height: 50)
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
     row :lead_architects
     row :area
     row :photographs
     row :image do |img|
       image_tag img.photo.url, height: 100, width: 100
     end
     row :visible

     panel "Images" do
       details = portfolio.portfolio_details
       table_for details do
         column :image do |img|
           image_tag img.photo.url, widht: 100, height: 100
         end
         column :visible
       end
     end
   end
 end

 form do |f|
   f.inputs"Uploads" do
     f.input :name
     f.input :introduce
     f.input :architect
     f.input :location, as: :select, collection: Settings.cities
     f.input :lead_architects
     f.input :area, as: :number
     f.input :photographs
     if f.object.photo.present?
      f.input :photo, as: :file, required: true, :hint => image_tag(f.object.photo.url) if f.object.photo.present?
     else
      f.input :photo, as: :file, required: true
     end
     f.input :visible
   end

   f.actions
 end

end
