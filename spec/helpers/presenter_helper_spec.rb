# frozen_string_literal: true

require 'rails_helper'

class Test
  def test_method
    true
  end
end
class TestSecond
  def test_method
    true
  end
end
class TestPresenter < BasePresenter
  def initialize(model, view)
    @model = model
    @view = view
  end

  def test_presenter_method
    true
  end
end

RSpec.describe PresenterHelper do
  let(:without_class_name) { Class.new.extend(PresenterHelper).present(Test.new) }
  let(:with_class_name) { Class.new.extend(PresenterHelper).present(TestSecond.new, TestPresenter) }

  describe 'present' do
    it 'calls test_presenter_method of presenter using class name of the model passed' do
      expect(without_class_name.test_presenter_method).to eq true
    end
  end

  describe 'present' do
    it 'calls test_presenter_method of presenter using class name  passed as a second argument' do
      expect(with_class_name.test_presenter_method).to eq true
    end
  end
end
