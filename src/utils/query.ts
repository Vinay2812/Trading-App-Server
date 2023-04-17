export const processQueryOutput = {
    forFindAll: (data:any) => data.map(({ dataValues }: any) => dataValues),
    forUpdate: (data: any) => {
      let output =
        data instanceof Array
          ? data.map(({ dataValues }) => dataValues)
          : [data?.dataValues];
      return output;
    },
    forInsert: (data: any) => (data ? data.dataValues : null),
  };