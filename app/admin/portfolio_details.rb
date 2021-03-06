ActiveAdmin.register PortfolioDetail do
 actions :all
 belongs_to :portfolio, optional: true
 permit_params :photo, :visible, :introduce, :portfolio_id

 show do
   attributes_table do
     row :introduce
     row :image do |img|
       image_tag img.photo.url(size: nil)
     end
   end
 end

 index do
   column :id
   column :portfolio
   column :introduce
   column :image do |img|
     image_tag(img.photo.url(size: nil), width: 50, height: 50)
   end
   column :visible
   actions
 end

 form do |f|
   f.inputs "Uploads" do
     f.input :portfolio_id, label: "Portfolio", as: :select, collection: Portfolio.pluck(:name, :id), required: true
     f.input :photo, required: true, as: :file
     f.input :introduce, required: true
   end

   f.actions
 end
end
