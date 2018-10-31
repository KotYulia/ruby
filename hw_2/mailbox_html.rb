require './mailbox'

class MailboxHtmlFormatter
  def initialize(mailbox)
    @mailbox = mailbox
  end

  def head
"<head>
  <style>
    table {
      border-collapse: collapse;
    }
    td, th {
      border: 1px solid black;
      padding: 1em;
    }
  </style>
</head>"
  end

  def get_row(email)
    td_row = ""
    email.each do |value|
      td_row = td_row + "<td>#{value}</td>\n"
    end
    td_row
  end

  def body
    tr_row = ""
    @mailbox.box_values.each {|messages_arr| tr_row = tr_row + "<tr>#{get_row(messages_arr)}</tr>\n"}
"<body>
  <h1>#{@mailbox.name}</h1>
  <table>
    <thead>
      <tr>
        <th></th>
      </tr>
    </thead>
    <tbody>
      #{tr_row}
    </tbody>
  </table>
</body>"
  end

  def format
    "<html>
  #{head}
  #{body}
</html>"
  end
end


=begin

require './mailbox_html'
emails = [Email.new("Homework this week", {date: "24-10-2018", from: "Ferdous"}), Email.new("Keep on coding! :", {date: "24-10-2018", from: "Dajana"}), Email.new("Re: Homework this week", {date: "24-10-2018", from: "Ariane"})]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)
mailbox.result
puts formatter.format

File.write("emails.html", formatter.format)
=end