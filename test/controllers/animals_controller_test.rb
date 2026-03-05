require 'test_helper'

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal = animals(:one)
  end

  test 'should get index' do
    get animals_url
    assert_response :success
  end

  test 'should get new' do
    get new_animal_url
    assert_response :success
  end

  test 'should create animal' do
    assert_difference('Animal.count') do
      post animals_url, params: { animal: { unique_tag: '1234',
                                            species: 'Domestic Cattle',
                                            breed: 'Red Angus' } }
    end

    assert_redirected_to animal_url(Animal.last)
  end

  test 'should show animal' do
    get animal_url(@animal)
    assert_response :success
  end

  test 'should get edit' do
    get edit_animal_url(@animal)
    assert_response :success
  end

  test 'should update animal' do
    patch animal_url(@animal), params: { animal: { unique_tag: '356-543',
                                                   species: 'Domestic Cattle',
                                                   breed: 'Red Angus' } }
    assert_redirected_to animal_url(@animal)
  end

  test 'should not destroy animal with associated tests' do
    assert_no_difference('Animal.count') do
      delete animal_url(@animal)
    end

    assert_redirected_to animals_url
  end

  test 'should soft delete animal' do
    animal = animals(:two)

    assert_no_difference('Animal.unscoped.count') do
      delete animal_url(animal)
    end

    animal.reload
    assert animal.discarded?
    assert_not_nil animal.discarded_at
    assert_not_includes Animal.all, animal
    assert_includes Animal.all_discarded, animal
    assert_redirected_to animals_url
  end
end
