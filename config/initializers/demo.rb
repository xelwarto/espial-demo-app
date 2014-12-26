
require 'espial'

class DemoApp < Espial::Engine
  draw do
    basePath '/demo'
    host 'localhost:3000'
    schemes ['http','https']
    info do
      title 'Test Application'
      version '0.1'
      contact do
        name 'Ted Elwartowski'
        email 'xelwarto.pub@gmail.com'
      end
    end

    path '/users' do
      get do
        tags ['users']
        controller 'users#show'
        description 'Get a list of users'

        parameter do
          name 'limit'
          location 'query'
          required false
          type 'integer'
        end
      end
    end

    path '/user/{id}' do
      get do
        tags ['user']
        controller 'user#show'
        description 'Show user info'

        parameter do
          name 'id'
          location 'path'
          required true
          type 'string'
        end
      end
      post do
        tags ['user']
        controller 'user#update'
        description 'Set user info'

        parameter do
          name 'id'
        end
      end
    end
  end
end
