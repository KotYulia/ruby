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

  def body
"<body>
  <h1>#{@mailbox.name}</h1>
  <table>
    <thead>
      <tr>
        <th>#{@mailbox.info_keys.join("</th>\n        <th>")}</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>#{@mailbox.info_values.join("</td>\n      </tr>\n      <tr>\n        <td>")}</td>
      </tr>
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