class SharedLinksController < ApplciationController

  def sent_link
    p "=" * 30
    p params
    p current_user.id
    p "=" * 30
  end

end