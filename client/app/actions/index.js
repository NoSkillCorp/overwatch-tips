export const Actions = {
  UPDATE_COUNTER: "UPDATE_COUNTER"
}


const actionBuilder = (type, payload) => {
  if(!Actions.hasOwnProperty(type)) {
    console.warn("Unknown type", type)
    return 
  }
  return {
    type: Actions[type],
    payload
  }
}
export default actionBuilder