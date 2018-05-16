require "./spec_helper"

def pet_hash
  {"name" => "Fake", "breed" => "Fake", "age" => "1"}
end

def pet_params
  params = [] of String
  params << "name=#{pet_hash["name"]}"
  params << "breed=#{pet_hash["breed"]}"
  params << "age=#{pet_hash["age"]}"
  params.join("&")
end

def create_pet
  model = Pet.new(pet_hash)
  model.save
  model
end

class PetControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe PetControllerTest do
  subject = PetControllerTest.new

  it "renders pet index template" do
    Pet.clear
    response = subject.get "/pets"

    response.status_code.should eq(200)
    response.body.should contain("Pets")
  end

  it "renders pet show template" do
    Pet.clear
    model = create_pet
    location = "/pets/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Pet")
  end

  it "renders pet new template" do
    Pet.clear
    location = "/pets/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Pet")
  end

  it "renders pet edit template" do
    Pet.clear
    model = create_pet
    location = "/pets/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Pet")
  end

  it "creates a pet" do
    Pet.clear
    response = subject.post "/pets", body: pet_params

    response.headers["Location"].should eq "/pets"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a pet" do
    Pet.clear
    model = create_pet
    response = subject.patch "/pets/#{model.id}", body: pet_params

    response.headers["Location"].should eq "/pets"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a pet" do
    Pet.clear
    model = create_pet
    response = subject.delete "/pets/#{model.id}"

    response.headers["Location"].should eq "/pets"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
