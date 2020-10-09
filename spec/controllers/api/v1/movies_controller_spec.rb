require "rails_helper"

module Api
  module V1
        RSpec.describe MoviesController, type: :controller do
          describe "GET consult_movie_by_name" do
            login_user
            it "params name não informado" do
              get :consult_movie_by_name, :params => { :name => nil }

              expect(json["message"]).to eq("Nenhum filme encontrado")
              expect(response.status).to eq 400
              expect(json['movies']['movie']).to eq({})
            end

            it "params name existente na api" do
              get :consult_movie_by_name, :params => { :name => "hackers" }

              expect(response.status).to eq 200
            end

            it "params name não encontrado na api" do
              get :consult_movie_by_name, :params => { :name => "inoxidavel" }

              expect(json["message"]).to eq("Nenhum filme encontrado")
              expect(response.status).to eq 400
              expect(json['movies']['movie']).to eq({})
            end
          end

          describe "GET consult_movie_by_id" do
            login_user
            it "params id não informado" do
              get :consult_movie_by_id, :params => { :id => nil }

              expect(json["message"]).to eq("Nenhum filme encontrado")
              expect(response.status).to eq 400
              expect(json['movies']['movie']).to eq({})
            end

            it "params id existente na api" do
              get :consult_movie_by_id, :params => { :id => "tt1905051" }

              expect(response.status).to eq 200
            end

            it "params id não encontrado na api" do
              get :consult_movie_by_id, :params => { :id => "tt6548855" }

              expect(json["message"]).to eq("Nenhum filme encontrado")
              expect(response.status).to eq 400
              expect(json['movies']['movie']).to eq({})
            end
          end
        end
    end
end
