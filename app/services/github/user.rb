module Github
  class User < SimpleDelegator
    attr_reader :name

    def initialize(name: '')
      @name = name
      @user = Octokit.user(name)
      self.__setobj__ @user
    end

    def valid?
      @user.present?
    end
  end
end
