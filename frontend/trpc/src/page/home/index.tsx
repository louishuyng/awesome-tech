import { Typography } from "antd";
import React from "react";
import ListItem from "../ListItem";

const { Title } = Typography;

function Home() {
  return (
    <div className=" m-6">
      <Title level={2}>TODOS</Title>
      <div className="mt-10">
        <ListItem />
      </div>
    </div>
  );
}

export default Home;
