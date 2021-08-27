# You can use `jbuilder` or preferably `jb` as JSON template engines.
# But if you have few templates to cover, this should do the job
#
# Inject to your controller or parent controller, then use to render a model
#
# ```
# include JsonTemplates
# render json: to_user_json(User.first)
# ```
module JsonTemplates
  @account
  def to_admin_json(account)
    {
      id: account.id,
      email: account.email,
      first_name: account.first_name,
      last_name: account.last_name
    }
  end

end