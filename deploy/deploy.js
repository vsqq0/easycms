var http = require('http')
  , exec = require('exec')

const PORT = 9988
  , PATH = '../html'

var deployServer = http.createServer(function(request, response) {
  console.log(request.url,request.url.search(/deploy\/?$/i))
  if (request.url.search(/deploy\/?$/i) > 0) {
    var commands = [
      'cd ..',
      'sudo git pull',
      'sudo docker-compose down',
      'sudo docker-compose build',
      'sudo docker-compose up -d'
    ].join(' && ')
    exec(commands, function(err, out, code) {
      if (err instanceof Error) {
        response.writeHead(500)
        response.end('Server Internal Error.')
        throw err
      }
      process.stderr.write(err)
      process.stdout.write(out)
      response.writeHead(200)
      response.end('Deploy Done.')
    })
  } else {
    response.writeHead(404)
    response.end('Not Found.')
  }
})

deployServer.listen(PORT)