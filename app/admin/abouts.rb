ActiveAdmin.register About do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :content, :address, :phone, :email, :quote, :photo, :name, :introduce
 form do |f|
  f.inputs "Project Details" do
     f.input :name
     f.input :introduce
     f.input :phone
     f.input :email
     f.input :photo, :required => false, :as => :file
     f.input :content
     f.input :address
     f.input :quote
      # Will preview the image when the object is edited
  end
  f.actions
 end
end
