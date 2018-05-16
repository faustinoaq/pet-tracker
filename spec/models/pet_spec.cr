require "./spec_helper"
require "../../src/models/pet.cr"

describe Pet do
  Spec.before_each do
    Pet.clear
  end
end
