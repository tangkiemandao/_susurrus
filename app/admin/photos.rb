ActiveAdmin.register Photo do
 permit_params :link, :caption

 form do |f|
   f.inputs "Uploads" do
     f.input :link, required: true, as: :file
     f.input :caption, required: true
   end

   f.actions
 end
end
