# What does the error message mean and how can it be fixed?

# The error message implies that the first argument of the send method
#   invocation is expected to be a method. However, the first argument
#   passed in is a string that represents a street address. Examining the
#   existing classes and modules provided, it's seen that a send method has
#   been defined for the Mailing module. Additionally, the Mailing module's send
#   method doesn't demonstrate that a method is required as the first argument,
#   which is inconsistent with what the error message implies. Looking back at the
#   send method invocation, it's observed that the send method is being called on
#   johns_phone_service, which is an object of the TelephoneService class. The
#   TelephoneService class doesn't include the Mailing module, but it does inherit
#   from CommunicationsProvider. The Mailing module hasn't been mixed into the
#   CommunicationsProvider class either though and CommunicationsProvider doesn't
#   inherit from any other class defined below that includes the Mailing module mixed in.
#   Accordingly, the intended send method isn't included anywhere in the lookup path,
#   and so a different send module that exists in a core Ruby class is ultimately being
#   called, and it expects a method as the first argument.

# To resolve this issue, the Mailing module should be mixed in, so that the unique
#  send method defined below will exist in the lookup path and will be invoked.

class Mail
  def to_s
    "#{self.class}"
  end
end

class Email < Mail
  attr_accessor :subject, :body

  def initialize(subject, body)
    @subject = subject
    @body = body
  end
end

class Postcard < Mail
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

module Mailing
  def receive(mail, sender)
    mailbox << mail unless reject?(sender)
  end

  # Change if there are sources you want to block.
  def reject?(sender)
    false
  end

  def send(destination, mail)
    "Sending #{mail} from #{name} to: #{destination}"
    # Omitting the actual sending.
  end
end

class CommunicationsProvider
  attr_reader :name, :account_number

  def initialize(name, account_number=nil)
    @name = name
    @account_number = account_number
  end
end

class EmailService < CommunicationsProvider
  include Mailing

  attr_accessor :email_address, :mailbox

  def initialize(name, account_number, email_address)
    super(name, account_number)
    @email_address = email_address
    @mailbox = []
  end

  def empty_inbox
    self.mailbox = []
  end
end

class TelephoneService < CommunicationsProvider
  def initialize(name, account_number, phone_number)
    super(name, account_number)
    @phone_number = phone_number
  end
end

class PostalService < CommunicationsProvider
  attr_accessor :street_address, :mailbox

  def initialize(name, street_address)
    super(name)
    @street_address = street_address
    @mailbox = []
  end

  def change_address(new_address)
    self.street_address = new_address
  end
end

rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

puts johns_postal_service.send(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
# => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError)