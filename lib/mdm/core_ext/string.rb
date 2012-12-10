class String
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def valid_email_address?
    !!(self =~ VALID_EMAIL_REGEX)
  end

  def invalid_email_address?
    !valid_email_address?
  end
end
