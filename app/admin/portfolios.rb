ActiveAdmin.register Portfolio do
 actions :all, :except => [:destroy]
 permit_params :name, :introduce, :image, :visible

 index do
   column :id
   column :name
   column :introduce
   column :image do |img|
     image_tag(img.image, width: 50, height: 50)
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
     row :image do |img|
       image_tag img.image, height: 100, width: 100
     end
     row :visible

     panel "Images" do
       details = portfolio.portfolio_details
       table_for details do
         column :introduce
         column :image do |img|
           image_tag img.image, widht: 100, height: 100
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
     f.input :image, as: :file, required: true
     f.input :visible
   end

   f.actions
 end

end
