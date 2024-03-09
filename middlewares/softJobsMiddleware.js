const getReport = async (req, res, next) => {
  const params = req.body
  const url = req.url
  console.log(
    `Hoy ${new Date()}
    se ha recibido una consulta de la ruta ${url}
    el usuario:`,
    params.email
  )
  next()
}

export { getReport }
