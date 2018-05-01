ActiveAdmin.register Bill do
  permit_params :id, :total, :patient_id, :payment_status, :discount, :tax,
                bill_item_attributes: [:type, :rate, :quantity, :id, :_destroy,]

  form do |f|
    f.inputs do
      f.input :patient
      f.input :payment_status, :collection => ['PENDING', 'PAID'], :selected => "PENDING"
      f.input :discount
      f.input :tax
    end

    f.has_many :bill_item, heading: 'Billing Items', allow_destroy: true, new_record: "Add new item" do |item|
      table do
          tr do
            th "Bill Type"
            th "Title"
            th "Descrition"
            th "Rate"
            th "Quantity"
            th "Discount in %"
            th "Actions"
          end
        end
      item.input :bill_type, :collection => ['CONSULTATION', 'THERAPY', 'ROOM', 'PHARMACY', 'OTHERS'], :input_html => { :rows => 1 }, label: false
      item.input :title, :input_html => { :rows => 1 }, label: false, placeholder: 'Title'
      item.input :description, :input_html => { :rows => 2 }, label: false, placeholder: 'Description'
      item.input :rate, label: false, placeholder: 'Rate'
      item.input :quantity, label: false, placeholder: 'Quantity'
      item.input :discount, label: false, placeholder: 'Discount %'

      # table do
      #   tr do
      #     th "Title"
      #     th "Descrition"
      #     th "Rate"
      #     th "Quantity"
      #     th "Discount in %"
      #   end
      #   tr do
      #     td item.input :title, :input_html => { :rows => 1 }, label: false
      #     td item.input :description, :input_html => { :rows => 1 }, label: false
      #     td item.input :rate, label: false
      #     td item.input :quantity, label: false
      #     td item.input :discount, label: false
      #   end
      # end
    end

    f.actions
  end
end
