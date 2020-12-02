Rails.application.routes.draw do
 
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  authenticate :user, ->(user) { user.role == 'dentist' } do
    resources :dentists, only: [:new]
  end

  authenticate :user, ->(user) { user.admin == true } do
    resources :dentists, only: [:destroy]
  end
  
  resources :dentists, except: [:new, :destroy] do
    resources :procedures, only: [:new, :create]
  end

  resources :procedures, only: [:index, :show, :edit, :update, :destroy]

  resources :appointments
  
  resources :services, only: [:new, :create]



  # DENTISTS
    # Index, show para todos verem qual é a lista de dentistas da clínica e entrar no show de cada um
    # new + create e edit+update disponíveis só para quem for admin
    # acho que não precisa de destroy para a clínica não perder o histórico do que aquele dentista fez
    # a url básica seria /dentists mesmo (sem nesting em outras rotas)

  # PROCEDURES
    # index e show para todos verem a lista de procedimentos da clínica, já linkando com quem são
    # os dentistas que performam cada um desses procedimentos
    # new + create, edit + update e destroy podem apenas ser acessados pelo dentista específico que tem
    # aqueles serviços
    # acho que a URL de index e show seria direto /procedures e /procedures/:id
    # fico na dúvida se as rotas de new e create não deveriam ser nestadas em dentist /dentists/:id/procedures/new

  # APPOINTMENTS
    # Index, show, new, create para todos os usuários logados => url tem que ser /user/:id/appointments
    # Edit, update e destroy só podem ser feitos um período antes da consulta (se for paciente)
    # mas se for dentista, pode fazer quando quiser
    # o dentista tem que ser capaz de acessar os appointments de todos os seus pacientes

  # TREATMENTS
    # acho que não precisa de rota para treatment. Podemos mostrar tudo que tem de treatment dentro de appointment
  
  # SERVICES
   # acho que tb não precisa de rota para services, porque já tem procedure (que mostra todos os services)
   # com os dentistas específicos
   # new + create 
end
