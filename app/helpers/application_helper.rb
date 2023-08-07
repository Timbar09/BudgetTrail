module ApplicationHelper
  def current_page_title
    if controller_name == 'categories' && action_name == 'index'
      'Categories'
    elsif controller_name == 'categories' && action_name == 'new'
      'Add a new category'
    elsif controller_name == 'expenses' && action_name == 'index'
      'Transactions'
    elsif controller_name == 'expenses' && action_name == 'new'
      'Add a new transaction'
    elsif controller_name == 'sessions'
      'Log In'
    elsif controller_name == 'registrations' && action_name == 'new'
      'Sign Up'
    elsif controller_name == 'registrations' && action_name == 'edit'
      'Edit Profile'
    elsif controller_name == 'passwords' && action_name == 'new'
      'Forgot Password'
    elsif controller_name == 'passwords' && action_name == 'edit'
      'Change Password'
    elsif controller_name == 'confirmations'
      'Resend Confirmation'
    elsif controller_name == 'unlocks'
      'Resend Unlock Instructions'
    else
      'BudgetTrail'
    end
  end
end
