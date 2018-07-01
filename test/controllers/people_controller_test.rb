require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:ユーザー1)
  end

  test 'should get index' do
    get people_url
    assert_response :success
  end

  test 'should get new' do
    get new_person_url
    assert_response :success
  end

  test 'should create person' do
    assert_difference('Patient.count') do
      post people_url, params: {person: {name: @person.name, relationship: @person.relationship}}
    end

    assert_redirected_to person_url(Patient.last)
  end

  test 'should show person' do
    get person_url(@person)
    assert_response :success
  end

  test 'should get edit' do
    get edit_person_url(@person)
    assert_response :success
  end

  test 'should update person' do
    patch person_url(@person), params: {person: {name: @person.name, relationship: @person.relationship}}
    assert_redirected_to person_url(@person)
  end

  test 'should destroy person' do
    assert_difference('Patient.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end