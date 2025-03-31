hs = {}
if obj.status ~= nil then
  if obj.status.conditions ~= nil then
     for i, condition in ipairs(obj.status.conditions) do
       if condition.type == "Ready" then
         hs.status = "Degraded"
         hs.message = ""
         if condition.status == "True" then
            hs.status = "Healthy"
         end
         if condition.message ~= nil then
            hs.message = condition.message
         end
         return hs
       end
     end
  end
end

hs.status = "Progressing"
hs.message = "Waiting for RabbitMQ Operator"
return hs
