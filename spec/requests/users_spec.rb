require 'swagger_helper'

RSpec.describe 'users', type: :request do

  path '/users' do

    get('list users') do
      response(200, 'successful') do
        run_test!
      end
    end

    post('create user') do
      tags 'Create User'
      consumes 'application/json'
      parameter name: :new_user, in: :body, schema: { '$ref' => '#/components/schemas/new_user' }

      response(201, 'successful') do
        let(:new_user) { { user: { name: 'test', email: 'test@example.com', tel: '0900000000' } } }

        run_test!
      end
    end
  end

  path '/users/{id}' do
    # 可換 FactoryBot
    let(:user) { User.create(name: 'test', email: 'test@gmail.com', tel: '0900000000') }
    let(:id) { user.id }

    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      response(200, 'successful') do

        run_test!
      end
    end

    patch('update user') do
      consumes 'application/json'
      parameter name: :new_user, in: :body, schema: { '$ref' => '#/components/schemas/new_user' }

      response(200, 'successful') do
        let(:new_user) { { user: { name: 'test', email: 'test@example.com', tel: '0900000000' } } }

        run_test!
      end
    end

    put('update user') do
      consumes 'application/json'
      parameter name: :new_user, in: :body, schema: { '$ref' => '#/components/schemas/new_user' }

      response(200, 'successful') do
        let(:new_user) { { user: { name: 'test', email: 'test@example.com', tel: '0900000000' } } }

        run_test!
      end
    end

    delete('delete user') do
      response(204, 'successful') do
        run_test!
      end
    end
  end
end
