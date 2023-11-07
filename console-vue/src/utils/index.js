const getWeekNumber = (number) => {
  switch (number) {
    case 0:
      return '周天'
    case 1:
      return '周一'
    case 2:
      return '周二'
    case 3:
      return '周三'
    case 4:
      return '周四'
    case 5:
      return '周五'
    case 6:
      return '周六'
  }
}

const getTicketNumber = (number) => {
  if (number && number > 20) {
    return {
      color: 'green',
      label: '有'
    }
  } else if (number && number < 20) {
    return {
      color: 'black',
      label: number
    }
  } else if (number === 0) {
    return {
      color: 'gray',
      label: '无'
    }
  } else {
    return {
      color: 'gray'
    }
  }
}

export { getWeekNumber, getTicketNumber }
