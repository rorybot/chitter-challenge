feature 'When creating peeps' do

  let!(:user) do
    User.create(email_address: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end


  scenario 'I can make new peeps on the peeps page' do
    # As a Maker
    # So that I can let people know what I am doing
    # I want to post a message (peep) to chitter
    sign_in(email_address: 'test@test.com', password: 'test')

    fill_in :peep_body, with: "I'm creeping and I'm peeping"
    click_button 'Peep'
    expect(find_by_id('peeps_list')).to have_content("I'm creeping and I'm peeping")
    expect(page).to_not have_content('If you were signed in you could peep here')
  end

  scenario 'I cannot peep if I am not signed in' do

    visit('/peeps')
    expect(page).to_not have_button 'Peep'
    expect(page).to have_content('If you were signed in you could peep here')
  end
end
