defmodule PublisherWeb.Auth.Guardian do
    use Guardian, otp_app: :publisher
    alias Publisher.Accounts

    def subject_for_token(%{id: id})
end
