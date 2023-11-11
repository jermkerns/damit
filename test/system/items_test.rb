require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Content description", with: @item.content_description
    fill_in "Content keywords", with: @item.content_keywords
    fill_in "Dimensions", with: @item.dimensions
    fill_in "File date created", with: @item.file_date_created
    fill_in "Fileformat", with: @item.fileformat
    fill_in "Filename", with: @item.filename
    fill_in "Filesize", with: @item.filesize
    fill_in "Filetype", with: @item.filetype
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Content description", with: @item.content_description
    fill_in "Content keywords", with: @item.content_keywords
    fill_in "Dimensions", with: @item.dimensions
    fill_in "File date created", with: @item.file_date_created
    fill_in "Fileformat", with: @item.fileformat
    fill_in "Filename", with: @item.filename
    fill_in "Filesize", with: @item.filesize
    fill_in "Filetype", with: @item.filetype
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
