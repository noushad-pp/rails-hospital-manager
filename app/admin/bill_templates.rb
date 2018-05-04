ActiveAdmin.register BillTemplate do
  permit_params :title, :subtitle, :image, :gst_no

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :gst_no
      f.input :image, as: :file, :hint => f.object.image.present? ? image_tag(f.object.image.url(:big_thumb)) : content_tag(:span)
    end

    f.actions
  end
end
