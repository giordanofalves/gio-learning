# frozen_string_literal: true

require "rails_helper"

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:course) { create(:course) }

    it "returns a success response" do
      get :show, params: { id: course.id }, format: :json
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:course) }

    context "with valid params" do
      it "creates a new course" do
        expect {
          post :create, params: { course: valid_attributes }, format: :json
        }.to change(Course, :count).by(1)
      end

      it "returns a created response" do
        post :create, params: { course: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { attributes_for(:course, title: nil) }

      it "does not create a new course" do
        expect {
          post :create, params: { course: invalid_attributes }, format: :json
        }.to_not change(Course, :count)
      end

      it "returns an unprocessable entity response" do
        post :create, params: { course: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    let(:course) { create(:course) }

    context "with valid params" do
      let(:new_attributes) { attributes_for(:course) }

      it "updates the requested course" do
        patch :update, params: { id: course.id, course: new_attributes }, format: :json
        course.reload
        expect(course.title).to eq(new_attributes[:title])
      end

      it "returns a success response" do
        patch :update, params: { id: course.id, course: new_attributes }, format: :json
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { attributes_for(:course, title: nil) }

      it "does not update the requested course" do
        patch :update, params: { id: course.id, course: invalid_attributes }, format: :json
        course.reload
        expect(course.title).to_not eq(invalid_attributes[:title])
      end

      it "returns an unprocessable entity response" do
        patch :update, params: { id: course.id, course: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:course) { create(:course) }

    it "destroys the requested course" do
      expect {
        delete :destroy, params: { id: course.id }, format: :json
      }.to change(Course, :count).by(-1)
    end

    it "returns a no content response" do
      delete :destroy, params: { id: course.id }, format: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
