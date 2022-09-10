# frozen_string_literal: true

RSpec.describe ModelDecorator do
  it "has a version number" do
    expect(ModelDecorator::VERSION).not_to be nil
  end

  context "When included" do
    class TestClass
      include ModelDecorator
    end

    let(:expected_method) {
      :decorate_with
    }

    it "decorate_with method is defined" do
      expect(TestClass.methods.include?(expected_method)).to be_truthy
    end

    context "decorate_with" do
      context "When klass is not a Class" do
        it "Raises an Exception" do
          expect { TestClass.decorate_with(:not_a_class, as: "Doesn't matter") }.to raise_exception(ModelDecorator::Error, "Expecting not_a_class to be Class")
        end
      end

      context "When klass is a Class but does not inherit from SimpleDelegator" do
        it "Raises an Exception" do
          expect { TestClass.decorate_with(TestClass, as: "Doesn't matter") }.to raise_exception(ModelDecorator::Error, "Expecting TestClass to inherit from SimpleDelegator")
        end
      end

      context "When klass is a Class that inherits from SimpleDelegator" do
        class TestDecoratorClass < SimpleDelegator; end

        context "When :as is not a Symbol" do
          it "Raises an Exception" do
            expect { TestClass.decorate_with(TestDecoratorClass, as: "Not a Symbol") }.to raise_exception(ModelDecorator::Error, "Expecting Not a Symbol to be Symbol")
          end
        end

        context "When :as is a Symbol" do
          it "Doesn't raise an Exception" do
            expect { TestClass.decorate_with(TestDecoratorClass, as: :symbol) }.to_not raise_exception
          end
        end
      end
    end
  end
end
