ActiveAdmin.register Bill do
  permit_params :id, :total, :patient_id, :payment_status, :discount, :tax, :billing_date,
                bill_item_attributes: [:bill_type, :title, :description, :type, :rate, :quantity, :discount, :id, :_destroy]

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :billing_date
      f.input :patient
      f.input :payment_status, :collection => ['PENDING', 'PAID'], :selected => "PENDING"
      f.input :discount, min:0
      f.input :tax, label: "tax (%)", min: 0
    end

    table do
      tr do
        th "Bill Type"
        th "Title"
        th "Descrition"
        th "Rate"
        th "Quantity"
        # th "Discount in %"
        th "Actions"
      end
    end
    f.has_many :bill_item, heading: 'Billing Items', allow_destroy: true, new_record: "Add new item" do |item|
      item.input :bill_type, :collection => ['CONSULTATION', 'THERAPY', 'ROOM', 'PHARMACY', 'OTHERS'], :input_html => { :rows => 1 }, label: false
      item.input :title, :input_html => { :rows => 1 }, label: false, placeholder: 'Title'
      item.input :description, :input_html => { :rows => 2 }, label: false, placeholder: 'Description'
      item.input :rate, label: false, placeholder: 'Rate', min: 0
      item.input :quantity, label: false, placeholder: 'Quantity', min: 1
      # item.input :discount, label: false, placeholder: 'Discount %', min: 0
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :patient
    column :payment_status
    column :billing_date
    column "Items" do |bill|
      bill.bill_item.count
    end
    column :discount
    column :tax
    column :total
    actions
  end

  show do |bill|
    attributes_table_for bill do
      row :patient
      row :billing_date
      row :payment_status
      row :discount
      row :tax
      row :total
    end

    panel "Billing Items" do
      table_for bill.bill_item, cellpadding: 10 do
        column :bill_type
        column :title
        column :description
        column :rate
        column :quantity
        column "Amount" do |item|
          item.rate * item.quantity
        end
        # column :discount
      end
    end
  end
end
