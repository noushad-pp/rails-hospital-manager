#!/usr/bin/env bash
rails g model Hospital name:string registration_id:string address:text phone:string email:string image:string details:text
rails g model Attachments url:string title:string attachable:references{polymorphic}
rails g model Image url:string imageable:references{polymorphic}
rails g model Department name:string
rails g model EmployeeRole name:string department:references
rails g model Employee name:string department:references employee_type:string degrees:text registration_no:string consultation_charge:float address:text phone:string email:string employee_role:references joining_date:date leaving_date:date salary:float additional_info:text
rails g model Patient name:string email:string gender:string phone:string address:text dob:date image:string
rails g model RoomType name:string description:text room_type:string charge:float
rails g model Room name:string status:string room_type:references
rails g model Admission patient:references admission_date:date discharge_date:date room:references status:string
rails g model Diagnosis symptoms:text observations:text attachments:references
rails g model Prescription prescription:text duration:integer attachments:references
rails g model TreatmentRecord treatment_type:string patient:references admission:references employee:references diagnosis:references prescription:references
rails g model BillItem bill_type:string rate:float quantity:float amount:float
rails g model Bill patient:references total:integer payment_status:string discount:float tax:float bill_items:references notes:text
rails g model BillTemplate title:string subtitle:text image:string gst_no:string
