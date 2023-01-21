import React from "react";
import { Row } from "antd";
import CardItem from "./components/CardItem";
import { trpc } from "../../utils/trpc";
import { Note } from "../../types";

function ListItem() {
  const { isLoading, error, data } = trpc.note.list.useQuery();

  if (isLoading) {
    return <div>Loading...</div>;
  }

  return (
    <Row gutter={[16, 16]}>
      {data?.map((item: Note) => {
        return <CardItem item={item} key={item.id} />;
      })}
    </Row>
  );
}

export default ListItem;
