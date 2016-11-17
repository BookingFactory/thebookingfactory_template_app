class GithubAccount < Sequel::Model
  many_to_one :hotel
end

GithubAccount.set_dataset :github_accounts
