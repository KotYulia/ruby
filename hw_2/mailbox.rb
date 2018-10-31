require './email'

class Mailbox

  def initialize(name, emails)
    @name = name
    @emails = emails
  end

  def name
    @name
  end

  def emails
    @emails
  end

  def box_keys
    @emails[0].emails_keys
  end

  def box_values
    emails.map {|email| email.emails_values}
  end

  def result
    @emails.each {|email| puts email.result}
  end
end



=begin

require './mailbox'
emails = [Email.new("Homework this week", {date: "24-10-2018", from: "Ferdous"}), Email.new("Keep on coding! :", {date: "24-10-2018", from: "Dajana"}), Email.new("Re: Homework this week", {date: "24-10-2018", from: "Ariane"})]
mailbox = Mailbox.new("Ruby Study Group", emails)
mailbox.result

=end