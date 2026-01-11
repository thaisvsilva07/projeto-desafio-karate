function fn() {
    var config = {}
    config.baseUrl = 'https://bookstore.demoqa.com'

    config.username = 'user_' + java.util.UUID.randomUUID()
    config.password = 'Senha123@@'

    karate.configure('retry', { count: 10, interval: 5000 })
    return config
}
