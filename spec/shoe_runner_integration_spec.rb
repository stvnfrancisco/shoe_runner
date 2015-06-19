require("spec_helper")

describe('the add shoes process', {:type => :feature}) do
  it('allows the user to add shoes to the database') do
    visit('/')
    fill_in('Add Shoe', :with => 'vans')
    click_button('Save Shoe')
    expect(page).to have_content('Vans')
  end

  it('allows the user to add stores to the database') do
    visit('/')
    fill_in('Add Store', :with => 'Zummies')
    click_button('Save Store')
    expect(page).to have_content('Zummies')
  end
end
