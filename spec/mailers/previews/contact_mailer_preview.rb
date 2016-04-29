# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactMailerPreview < ActionMailer::Preview
    def welcome
         params = { name: 'Fulano', email: 'teste@teste.com', message: 'Ola mundo'}
         ContactMailer.welcome(params)
    end
end
