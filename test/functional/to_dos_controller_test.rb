require "test_helper"

class ToDosControllerTest < ActionController::TestCase

  context "the ToDos controller" do

    context "on GET of index" do
      setup { get :index }

      should_respond_with :success
      should_assign_to :to_dos
    end

    context "on GET of show" do
      setup { get :show, :id => Factory(:to_do).to_param }

      should_respond_with :success
      should_assign_to :to_do
    end

    context "on GET of new" do
      setup { get :new }

      should_respond_with :success
      should_assign_to :to_do
    end

    context "on successful POST of create" do
      setup { post :create, :to_do => {:description => "Something important"} }

      should_change("the todo count", :by => 1) { ToDo.count }
      should_redirect_to("todo list") { to_dos_path }
      should_set_the_flash_to :notice => "Todo successfully created."
    end

    context "on unsuccessful POST of create" do
      setup { post :create, :to_do => {:description => ""} }

      should_not_change("the todo count") { ToDo.count }
      should_render_template "new"
      should_set_the_flash_to :error => "Description can't be blank"
    end

    context "on GET of edit" do
      setup { get :edit, :id => Factory(:to_do).to_param }

      should_respond_with :success
      should_assign_to :to_do
    end

    context "on sucessful PUT of update" do
      setup { put :update, :id => Factory(:to_do).to_param, :to_do => {:description => "Foo"} }

      should_assign_to :to_do
      should_redirect_to("todo list") { to_dos_path }
      should_set_the_flash_to :notice => "Todo successfully updated."
    end

    context "on unsucessful PUT of update" do
      setup { put :update, :id => Factory(:to_do).to_param, :to_do => {:description => ""} }

      should_assign_to :to_do
      should_render_template "edit"
      should_set_the_flash_to :error => "Description can't be blank"
    end

    context "on DELETE of destroy" do
      setup do
        @to_do = Factory(:to_do)
        delete :destroy, :id => @to_do.to_param
      end

      should_redirect_to("todo list") { to_dos_path }
      should_set_the_flash_to :notice => "Todo successfully removed."
      should("remove the todo") { assert_raise(ActiveRecord::RecordNotFound) { ToDo.find @to_do.to_param } }
    end

  end

end
