class ApplicationPolicy
  attr_reader :usuario, :record

  def initialize(usuario, record)
    @usuario = usuario
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  class Scope
    attr_reader :usuario, :scope

    def initialize(usuario, scope)
      @usuario = usuario
      @scope = scope
    end

    def resolve
      @usuario.administrador? ? scope.all : scope.where(usuario_id: @usuario.id)
    end
  end
end
