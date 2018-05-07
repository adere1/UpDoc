require 'rails_helper'

RSpec.describe AppointmentController, type: :controller do

  describe "show available appointments" do
    it "is successful" do
      @a = Appointment.create!({:pid=>nil, :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"A"})
      @f = Appointment.create!({:pid=>"Sue@oracle.com", :did=>"Aditya@bin.com", :slot=>"9:45", :av=>"F"})
      get :appointment
      expect(assigns(:data)).to include(@a)
      expect(assigns(:data)).to_not include(@f)
    end
  end

  describe "create appointment" do
    it "is successful" do
      @a = Appointment.create!({:pid=>nil, :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"A"})
      post :confirm, {:session => {:docid => 'Aditya@bin.com', :slot => '9:00', :pname => "Jeff@bin.com"} }
      @f = Appointment.create!({:pid=>"Jeff@bin.com", :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"F"})
      expect(assigns(:appt)).to include(@f)
    end
    it "is unsuccessful" do
      @a = Appointment.create!({:pid=>nil, :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"A"})
      post :confirm, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00', :pname => "Jeff@bin.com"} }
      expect(response).to have_content("Invalid Doctor or Time Slot")
    end
  end

end
