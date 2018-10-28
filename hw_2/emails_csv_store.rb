require './mailbox_html'
require 'csv'

class EmailsCsvStore
  def initialize(filename)
    @filename = CSV.new(File.read(filename), headers: true)
  end

  def read
    @filename.map do |info|
      info = info.to_hash
      Email.new(info["Subject"], { from: info["From"], date: info["Date"] })
    end
  end

end

store = EmailsCsvStore.new('emails.csv')
emails = store.read
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

File.write("emails.html", formatter.format)

puts "Done! Open emails.html file via browser."