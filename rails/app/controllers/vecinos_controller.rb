class VecinosController < ApplicationController
    def index
        @vecinos = Vecino.all
    end
    def show
        #@vecino = Vecino.find(params.get([:id]))
    end
    def new
    end
    def edit
    end
    def update
    end
    def destroy
    end
    def create
        @vecino = Vecino.new
    end
end
