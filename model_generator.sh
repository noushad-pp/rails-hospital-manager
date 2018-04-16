--- Hospital 
    name:string 
    registration_id:string 
    address:string 
    phone:string 
    email:string 
    image:string 
    gst_no:string;

--- Patient 
    name:string 
    email:string 
    gender:string
    phone:string 
    address:string 
    dob:date 
    image:string;

--- Department 
    name:string 

--- Employee 
    name:string 
    department:references 
    employee_type:string //fulltime, visiting
    degrees:string
    registration_no:string
    consultation_charge:float
    address:string 
    phone:string 
    email:string 
    employee_role:references 
    joining_date:date 
    leaving_date:date 
    salary:float 
    additional_info:string;

--- Employee_role 
    name:string, 
    department:references;

--- Admission 
    patient:references 
    admission_date:date 
    discharge_date:date 
    room:references 
    status:string;

--- Room 
    name:string 
    room_type:references
    charge:float;

--- TreatmentRecord
    patient:references 
    admission:references 
    employee:references 
    diagnosis:references 
    prescription:references ;

---Diagnosis
    symptoms:string 
    obserations:string
    attachments:references;

---Attachments
    url:string 
    title:string
    attachable:references{polymorphic};

--- Bills 
    patient:references 
    total:integer 
    payment_status:string 
    discount:float 
    tax:float 
    bill_items:references;

--- BillItems 
    type:string 
    rate:float 
    quantity:float 
    amount:float;

--- BillTemplate 
    title:string 
    subtitle:string 
    image:string 
    gst_no:string;