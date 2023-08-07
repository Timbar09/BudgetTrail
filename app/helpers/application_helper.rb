module ApplicationHelper
  PAGE_TITLES = {
    'categories#index' => 'Categories',
    'categories#new' => 'Add a new category',
    'expenses#index' => 'Transactions',
    'expenses#new' => 'Add a new transaction',
    'sessions#new' => 'Log In',
    'registrations#new' => 'Sign Up',
    'registrations#edit' => 'Edit Profile',
    'passwords#new' => 'Forgot Password',
    'passwords#edit' => 'Change Password',
    'confirmations#new' => 'Resend Confirmation',
    'unlocks#new' => 'Resend Unlock Instructions'
  }.freeze

  DEFAULT_TITLE = 'BudgetTrail'.freeze

  def current_page_title
    PAGE_TITLES["#{controller_name}##{action_name}"] || DEFAULT_TITLE
  end
end
