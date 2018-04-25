rails g model Hospital name:string registration_id:string address:string phone:string email:string image:string gst_no:string
rails g model Attachments url:string title:string attachable:references{polymorphic}
rails g model Image url:string imageable:references{polymorphic}
rails g model Department name:string
rails g model EmployeeRole name:string department:references
rails g model Employee name:string department:references employee_type:string degrees:string registration_no:string consultation_charge:float address:string phone:string email:string employee_role:references joining_date:date leaving_date:date salary:float additional_info:string
rails g model Patient name:string email:string gender:string phone:string address:string dob:date image:string
rails g model Room name:string type:string room_type:string charge:float
rails g model Admission patient:references admission_date:date discharge_date:date room:references status:string
rails g model Diagnosis symptoms:string obserations:string attachments:references
rails g model Prescription prescription:string duration:integer attachments:references
rails g model TreatmentRecord type:string patient:references admission:references employee:references diagnosis:references prescription:references
rails g model BillItem type:string rate:float quantity:float amount:float
rails g model Bill patient:references total:integer payment_status:string discount:float tax:float bill_items:references
rails g model BillTemplate title:string subtitle:string image:string gst_no:string
